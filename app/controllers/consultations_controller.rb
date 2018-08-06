class ConsultationsController < ApplicationController
  
  def index
    @indications = Indication.order(:created_at)
  end

  def calculate_result
    if request.post?
      if consultation_params.present?
        @results = calculate_result_action(consultation_params)
        render @result
      else
        respond_to do |format|
        format.html { redirect_to consultations_path, notice: 'Pilih minimal satu gejala.'}
      end
      end
    else
      respond_to do |format|
        format.html { redirect_to consultations_path }
      end
    end
  
    def calculate_result_get
      respond_to do |format|
        format.html { redirect_to consultations_path }
      end
    end
    
  end

  private

    def consultation_params
      params[:consultation]
    end

    def calculate_result_action(params)
      indications = params[:indication_ids].join(',')
      puts indications
      # s
      @rules = Rule.where("indication_id in (#{indications})").joins(:trouble, :indication).group_by(&:trouble_id)

      sum_multiply = 0
      troubles_multiply = {}
      troubles_result = {}

      @rules.each do |trouble_id, trouble_indications|
        trouble = Trouble.find(trouble_id)
        trouble_multiply = trouble.weight

        trouble_indications.each do |indication|
          trouble_multiply = trouble_multiply * indication.weight
        end

        sum_multiply = sum_multiply + trouble_multiply
        troubles_multiply["#{trouble_id}"] = trouble_multiply
      end

      troubles_multiply.each do |trouble_id, multiply|
        result = multiply / sum_multiply
        troubles_result["#{trouble_id}"] = result
      end

      # puts "troubles_result"
      # puts "#{troubles_result.max_by{|k,v| v}}"

      return {
        selected_indications: indications,
        troubles_multiply: troubles_multiply,
        sum_multiply: sum_multiply,
        troubles_result: troubles_result,
      }
    end
end
