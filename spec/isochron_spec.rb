RSpec.describe Isochron do
  it 'runs the contents of a block exactly once' do
    mything = double('mything')
    proc = Isochron.capture { mything.do_something }

    expect(mything).to receive(:do_something).once.and_return(true)

    expect(proc.call).to eq(true)
    expect(proc.call).to eq(true)
  end

  it 'is thread safe' do
    mything = double('mything')    
    proc = Isochron.capture { mything.do_something }

    expect(mything).to receive(:do_something).once.and_return(true)

    threads = []
    10.times { Thread.new { expect(proc.call).to eq(true) } }

    threads.each(&:join)
  end

  it 'mutates state' do
    list = %w[a b c]
    proc = Isochron.capture { list.pop }

    expect(proc.call).to eq('c')
    expect(proc.call).to eq('c')

    expect(list).to eq(%w[a b])
  end
end
