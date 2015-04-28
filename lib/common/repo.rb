  module Repos

    class Repo

      def self.for impl
        new(impl)
      end

      private

      def initialize impl
        @impl = impl
        delegate_to_impl methods
      end

      def delegate_to_impl methods
        methods.each do |method_name|
          create_method method_name do |*arguments|
            @impl.send(method_name, *arguments)
          end
        end
      end

      def create_method name, &block
        self.class.send(:define_method, name, &block)
      end

    end
  end
  