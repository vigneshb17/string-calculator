require './string_calculator.rb'

RSpec.describe 'StringCalculator' do
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
      
      context 'with positive cases' do
        before :each do 
          @calculator = StringCalculator.new  
        end 

        it 'expects the instance value should be matched with class instance' do
          expect(@calculator.instance_of?(StringCalculator)).to eql true
        end
    
        it 'expects the result as 0 if passed empty string as an argument' do
          expect(@calculator.add('')).to eql 0
        end
    
        it "expects the result as 3 if passed string - '1,2' as an argument" do
          expect(@calculator.add('1,2')).to eql 3
        end
    
        it "expects the result as 10 if passed '1,2,3,4' as an argument" do
          expect(@calculator.add('1,2,3,4')).to eql 10
        end
    
        it "expects the result as 6 if passed '1\n2,3' as an argument" do
          expect(@calculator.add("1\n2,3")).to eql 6
        end
    
        it "expects the result as 3 if passed '//;\n1;2' as an argument" do
          expect(@calculator.add("//;\n1;2")).to eql 3
        end
    
        it "expects the result as 12 if passed '//----\n1----2,3,6' as an argument" do
          expect(@calculator.add("//----\n1----2,3,6")).to eql 12
        end
      end
   end 
end 
