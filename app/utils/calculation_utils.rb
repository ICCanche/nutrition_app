module CalculationUtils
    def self.calculateIMC(weight, height)
        result = weight.to_f / (height.to_f ** 2)
        '%.2f' % result
    end
end