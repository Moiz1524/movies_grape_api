require 'rails_helper'

RSpec.describe Movie, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'Attributes' do

    it { should have_db_column(:name).of_type(:string) }

    it { should have_db_column(:released).of_type(:datetime) }

    it { should have_db_column(:points).of_type(:integer) }

    it { should have_db_column(:liked).of_type(:boolean) }

  end

end
