module CartsHelper
  def step_class(target_step, current_step)
    return 'active' if target_step.to_i.eql? current_step.to_i
    return 'completed' if target_step.to_i < current_step.to_i
  end
end