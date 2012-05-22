require 'spec_helper'

describe 'Loader' do
  subject { structure }

  specify do
    structure.keys = ['name', 'meta', 'overlays', 'namespaces']
  end
end

describe Project do
  subject { project }

  let(:project { Project.new(structure).build })

  describe '.build' do
    
  end
end

  