require 'spec_helper'

describe 'provisioning' do
    describe command('sudo puppet apply --detailed-exitcodes -e "include arcanist"') do
        it 'runs without failures' do
            expect(subject.exit_status & 4).to be == 0
            expect(subject.stdout).to_not match /fail/i
        end

        it 'runs without warnings' do
            expect(subject.stdout).to_not match /warning|error/i
        end
    end

    describe command('sudo puppet apply --detailed-exitcodes -e "include arcanist"') do
        it 'is idempotent' do
            expect(subject.exit_status & 2).to be == 0
        end
    end
end

describe 'validating' do
    describe command('arc help') do
        it { should return_exit_status 0 }
        its(:stdout) { should_not match /need to install|missing/ }
    end
end
