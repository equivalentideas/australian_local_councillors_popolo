require('csv')

class CouncillorCSVMerger
  def initialize(master_csv_path:, changes_csv_path:)
    @master_csv_path = master_csv_path
    @changes_csv_path = changes_csv_path
  end

  def merge
    CSV.open(@master_csv_path, "a+", headers: true) do |master_csv|
      CSV.read(@changes_csv_path, "r", headers: true).each do |changes_row|
        master_csv << changes_row
      end
    end
  end
end