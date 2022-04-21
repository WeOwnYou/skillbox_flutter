mixin MailGetterMixin on User{
  String? getMailSystem(){
    String mailSystem = '';
    for(int i = 0; i < _email.length;i++){
      if(_email[i] == '@'){
        for(int j = i+1; j < _email.length;j++){
          mailSystem += _email[j];
        }
        return mailSystem;
      }
    }
    return null;
  }
}

abstract class User{
  final String _email;

  String get email => _email;

  User(this._email);
}

class AdminUser extends User with MailGetterMixin{
  AdminUser(String email) : super(email);
}

class GeneralUser extends User with MailGetterMixin{
  GeneralUser(String email) : super(email);
}

class UserManager<T extends User>{
  List<T> _users;
  UserManager(this._users);
  void addUser(T user)=>_users.add(user);
  void deleteLastUser()=>_users.removeLast();
  void clear()=>_users.clear();
  void printAllUsersExceptAdmin(){
    for(T user in _users){
      if(user is AdminUser) {
        print(user.getMailSystem());
        continue;
      }
      print(user._email);
    }
  }
}