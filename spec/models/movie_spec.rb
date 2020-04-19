require 'rails_helper'

RSpec.describe Movie, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'Attributes' do

    it { should have_db_column(:name) }

    it { should have_db_column(:released) }

    it { should have_db_column(:points) }

    it { should have_db_column(:liked) }

  end

end
