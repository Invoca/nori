module NoriSavon
  module CoreExt
    module Object

      def blank?
        respond_to?(:empty?) ? empty? : !self
      end unless method_defined?(:blank?)

    end
  end
end

Object.send :include, NoriSavon::CoreExt::Object
