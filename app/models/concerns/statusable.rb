module Statusable
  extend ActiveSupport::Concern
  included do
    # status 默认0可见 1 不可见
    enum status: [ :visible, :invisible ]
    validates :status, inclusion: { in: %w(visible invisible) }
  end
end
