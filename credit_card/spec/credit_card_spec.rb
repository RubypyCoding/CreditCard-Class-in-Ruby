require 'credit_card'

describe CreditCard do
  #creditcard1
  let(:amex) { CreditCard.new("Amex", "2345673444", "12/15", "2345", [234, 567, 456, 567, 344]) }
  #creditcard2
  let(:bancomer) { CreditCard.new("Bancomer", "2345673444", "12/15", "2645", [234, 345, 456, 567, 344]) }

  describe "#initialize" do
    context "CreditCard is created" do
      subject { CreditCard.new("Amex", "2345673444", "12/15", "2345", [234, 567, 456, 567, 344]) }
      it(:name) { should_not be_nil }
      it(:number) { should_not be_nil }
      it(:expiration) { should_not be_nil }
      it(:cvc) { should_not be_nil }
      it(:status) { should_not be_nil }
      
      it "creates a new CreditCard" do
        expect(amex).to be_an_instance_of CreditCard
      end
    end
  end
  
  describe "#name" do
    context "#name is evaluated out of class" do
      it "#name as attr_reader" do
      	expect(amex.name).to eq("Amex")
      end
      it "#name as attr_writer" do
      	expect{amex.name = "Serfín"}.to raise_error(NoMethodError)
      end
    end
  end

  describe "#number" do
  	context "#number is evaluated out of class" do
  	  it "#number as attr_reader" do
  	  	expect(amex.number).to eq("2345673444")
  	  end
  	  it "#number as attr_writer" do
  	  	expect{amex.number = "2345683446"}.to raise_error(NoMethodError)
  	  end
  	end
  end

  describe "#expiration" do
  	context "#expiration is evaluated out of class" do
  	  it "#expiration as attr_reader" do
  	  	expect(amex.expiration).to eq("12/15")
  	  end
  	  it "#expiration as attr_writer" do
  	  	expect{amex.expiration = "12/23"}.to raise_error(NoMethodError)
  	  end
  	end
  end

  describe "#cvc" do
 	context "#cvc is evaluated out of class" do
  	  it "#cvc as attr_reader" do
  	  	expect(amex.cvc).to eq("2345")
  	  end
  	  it "#cvc as attr_writer" do
  	  	expect{amex.cvc = "2347"}.to raise_error(NoMethodError)
  	  end
  	end
  end

  describe "#status" do
 	context "#status is evaluated out of class" do
  	  it "#status as attr_reader" do
  	  	expect(amex.status).to eq([234, 567, 456, 567, 344])
  	  end
  	  it "#status as attr_writer" do
  	  	expect{amex.status = [234, 567, 456, 567, 480]}.not_to raise_error
  	  end
  	end
  end

  describe "#total_status" do
  	context "Checks #total_status" do
  	  it "#total_status returns total of balances of creditcard" do
  	    expect(bancomer.total_status).to eq(1946)
  	  end
  	end
  end

end

describe Portfolio do
  #creditcard1
  let(:amex) { CreditCard.new("Amex", "2345673444", "12/15", "2345", [234, 567, 456, 567, 344]) }
  #creditcard2
  let(:scotiabank) { CreditCard.new("ScotiaBank", "2345673744", "12/16", "2845", [234, 345, 456, 567, 344]) }
  #creditcard3
  let(:bancomer) { CreditCard.new("Bancomer", "2345673444", "12/15", "2645", [234, 345, 456, 567, 344]) }
  #creditcard4
  let(:serfin) { CreditCard.new("Serfin", "2345473454", "12/20", "1345", [234, 345, 456, 567, 344]) }
  #creditcard5
  let(:bancoppel) { CreditCard.new("BanCoppel", "2345373464", "12/18", "2445", [567, 345, 456, 567, 344]) }
  #creditcard6
  let(:banregio) { CreditCard.new("BanRegio", "2345373464", "12/18", "2445", [567, 345, 456, 567, 344]) }
  #new portfolio with 5 creditcards
  let(:new_portfolio) { [amex, scotiabank, bancomer, serfin, bancoppel] }
  #portfolio 1
  let(:portfolio_1) { Portfolio.new(new_portfolio) }

  describe "#initialize" do
    context "Portfolio is created" do
      subject { Portfolio.new(new_portfolio) }
      it(:portfolio) { should_not be_nil }
 
      it "creates a new Portfolio" do
        expect(portfolio_1).to be_an_instance_of Portfolio
      end
    end
  end

  describe "#how_many_cards?" do
  	context "Checks #how_many_cards?" do
  	  it "if #how_many_cards? returns total de creditcards in portfolio" do
  	  	expect(portfolio_1.how_many_cards?).to eq(5)
  	  end
  	end
  end

  describe "#add_creditcard" do
  	context "Checks #add_creditcard" do
      it "if #add_creditcard adds a new creditcard in portfolio" do
        expect{portfolio_1.add_creditcard(banregio)}.not_to raise_error
        expect(portfolio_1.how_many_cards?).to eq(6)
      end
  	end
  end

  describe "#sum_portfolio" do
  	context "Checks #sum_portfolio" do
  	  it "if #sum_portfolio returns total balances of portfolio" do
  	  	portfolio_1.add_creditcard(banregio)
  	  	expect(portfolio_1.sum_portfolio).to eq(12564)
  	  end
  	end
  end

  describe "#delete_creditcard" do
    context "Checks #delete_creditcard" do
      it "if #delete_creditcard drops a creditcard from portfolio" do
      	portfolio_1.add_creditcard(banregio)
        expect{portfolio_1.delete_creditcard("Bancomer")}.not_to raise_error
        expect(portfolio_1.how_many_cards?).to eq(5)
        expect(portfolio_1.sum_portfolio).to eq(10618)
      end
    end
  end
end