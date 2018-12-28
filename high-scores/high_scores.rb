class HighScores

  attr_reader :scores

  def initialize(scores)
    @scores = scores.dup.freeze
  end

  def latest
    @latest ||= scores.last
  end

  def personal_best
    @personal_best ||= scores.max
  end

  def personal_top
    @personal_top ||= scores.max(3)
  end

  def report
    "Your latest score was #{latest}. #{personal_best_report}"
  end

  def personal_best_report
    if latest == personal_best
      "That's your personal best!"
    else
      "That's #{personal_best - latest} short of your personal best!"
    end
  end
end