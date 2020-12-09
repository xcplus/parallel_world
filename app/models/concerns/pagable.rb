module Pagable
  extend ActiveSupport::Concern

  included do
    def self.total_count
      unscope(:limit, :offset).count
    end
  end
end