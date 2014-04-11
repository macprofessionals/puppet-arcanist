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

    # php-apc requires phpapi-20090626, which is a virtual package provided by
    # php5-fpm and also mod_php. We don't want or need php-fpm because it
    # consumes port 9000 for no good reason.

    describe package('php5-fpm') do
        it { should_not be_installed }
    end
end
