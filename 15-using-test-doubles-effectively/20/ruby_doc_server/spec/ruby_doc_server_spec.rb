require 'ruby_doc_server'
require 'stringio'

RSpec.describe RubyDocServer do
  it 'finds matching ruby methods' do
    result = get('/Array/min')

    expect(result).to eq(<<~EOS)
      Content-Type: application/json

      ["min","min_by","minmax","minmax_by"]
    EOS
  end

  def get(path)
    output = StringIO.new
    RubyDocServer.new(output: output).process_request(path)
    output.string
  end
end
