require "rspec/core"
require "rspec/core/memoized_helpers"

module RSpec
  module Core
    module MemoizedHelpers
      module ClassMethods
        @@let = self.instance_method(:let)

        def let(*names, &block)
          #byebug
          if names.count > 1
            results = block.call
            names.each.with_index do |n,i|
              _let n do
                # raise inside _let block for lazyload
                raise 'Names are duplicated' if names.count != names.uniq.count
                raise 'Block returns non Array object' unless results.is_a?(Array)
                raise 'Too few names' if results.count > names.count
                raise 'Too many names' if names.count > results.count
                results[i]
              end
            end
          else
            _let(names.first, &block)
          end
        end

        private

        def _let(name, &block)
          @@let.bind(self).call(name, &block)
        end
      end
    end
  end
end
