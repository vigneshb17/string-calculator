require 'string_calculator'

Rspec.describe 'StringCalculator' do
   describe '#add' do
      context 'with negative cases' do
        before :each, create_calculator_object: true do 
           @calculator = StringCalculator.new  
        end     

        it 'expects the instance value should not be matched with class instance' do
          expect(@calculator.instance_of?('StringCalculator')).to eql false  
        end    

        it 'expects raise error as negative numbers not allowed -1', :create_calculator_object do
          expect { @calculator.add("-1,2") }.to raise_error RuntimeError, 'negative numbers not allowed -1'
        end
    
        it 'expects raise error as negative numbers not allowed -1, -2', :create_calculator_object do
          expect { @calculator.add("-1\n-2,3") }.to raise_error RuntimeError, 'negative numbers not allowed -1, -2'
        end
      end   
   end 
end    