class RearingController < ApplicationController

  def index
    # 未ログインであれば、ログイン画面へリダイレクト
    if current_user.nil?
      return redirect_to action: 'login', status: 301
    end
    puts current_user
    @users = User.order(id: :desc).limit(20).offset(0).select("id", "nickname", "email")
    @facilities = Sensor.order(id: :asc).limit(20).offset(0).select("id", "name", "explanation")
    @tempHumidities = TempHumidity.order(id: :desc).limit(50).offset(0).select("id", "temp", "humidity", "inspected_at")
    return render layout: 'layouts/application'
  end

  def login
    return render layout: 'layouts/public'
  end
  def authenticate
    logger.debug params
    user = User.find_by(nickname: params[:nickname])
    if (user.blank? || !user.authenticate(params[:password]))
      @nickname = params[:nickname]
      flash.now[:danger] = 'ニックネームまたはパスワードに誤りがあります。'
      return render layout: 'layouts/public', template: 'rearing/login'
    end
    log_in(user)
    return redirect_to action: 'index', status: 301
  end
  def logout
    log_out()
    flash.now[:success] = 'ログアウトが完了しました。'
    return redirect_to action: 'login', status: 301
  end
end
