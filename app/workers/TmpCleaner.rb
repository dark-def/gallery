class TmpCleaner
  @queue = :tmpcleaner

  def self.perform()
    TmpImages.where("created_at < ?", 1.days.ago).delete_all
    p 'Old images successfuly deleted!'
  end

end