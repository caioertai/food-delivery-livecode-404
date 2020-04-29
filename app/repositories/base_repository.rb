class BaseRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @elements = []
    load_csv if File.exist?(csv_path)
  end

  def all
    @elements
  end

  def add(new_element)
    new_element.id = next_id
    @elements << new_element
    update_csv
  end

  def find(id)
    @elements.find { |element| element.id == id }
  end

  private

  def update_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << @elements.first.class.headers
      @elements.each do |element|
        csv << element.to_a
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |attributes|
      @elements << build_element(attributes)
    end
  end

  def next_id
    @elements.empty? ? 1 : @elements.last.id + 1
  end
end
