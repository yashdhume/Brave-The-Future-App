import 'package:scoped_model/scoped_model.dart';
import 'package:brave_the_future/data/auth.dart';
import 'package:brave_the_future/data/database.dart';
import 'package:brave_the_future/data/user.dart';
class ViewModel extends Model{
  Auth auth;
  User user;
  PageState userDefined = PageState.FAIL;
  void onSetUser(User value){
    this.user = value;
    notifyListeners();
  } 
  void onSetUserDefined(PageState value){
    userDefined = value;
    notifyListeners();
  }
  void onSignOut(){
    auth = null;
    user = null;
    userDefined = PageState.FAIL;
    auth.signOut();
    notifyListeners();
  }
  Future<void> checkNewUser() async{
    onSetUserDefined(PageState.UND);
    User value = await getUser(this.auth);
    print(value);
    if (value == null) {
      value = await createUser(User.newUser(auth.getUID()));
    }
    user = value;
    onSetUserDefined(PageState.VAL);
    notifyListeners();
  }
  void onSetAuth(Auth value){
    this.auth = value;
    notifyListeners();
  }
  void onDonated(double amount){
    user.totalDonated += amount;
    updateUser(user);
    notifyListeners();
  }
}
enum PageState{
  UND, VAL, FAIL,
}