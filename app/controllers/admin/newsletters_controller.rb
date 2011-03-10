module Admin
  class NewslettersController < Admin::BaseController

    crudify :newsletter,
            :title_attribute => 'name'

    def index
      search_all_newsletters if searching?
      paginate_all_newsletters

      render :partial => 'newsletters' if request.xhr?
    end


    def download_csv  
      csv_lib = RUBY_VERSION =~ /1.8/ ? FasterCSV : CSV

      csv_string = csv_lib.generate do |csv|
        csv << ["Name", "Email"]
        Newsletter.all.each do |newsletter|
          csv << [newsletter.name, newsletter.email]
        end
      end
      send_data(csv_string, 
                :type =>  'text/csv; charset=utf-8; header=present',
                :filename => "newsletters_#{Date.today.to_s}.csv")
    end
    
  end
end
