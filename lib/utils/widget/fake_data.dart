import 'package:contact_app/models/my_contact_data.dart';
import 'package:contact_app/utils/icon/icons.dart';

class FakeData {
  static List<MyContactInfo> getMyContacts() {
    List<MyContactInfo> myContactsInfo = [];

    myContactsInfo.add(
      MyContactInfo(
          aboutInfo: 'Korean',
          iconPath: MyIcons.food3,
          contactName: 'Shokhruz',
          contactNumber: '+99 877 31 877 79'),
    );
    myContactsInfo.add(
      MyContactInfo(
          aboutInfo: 'Uzbekistan',
          iconPath: MyIcons.food2,
          contactName: 'Sheroz',
          contactNumber: '+99 877 37 877 78'),
    );
    myContactsInfo.add(
      MyContactInfo(
          aboutInfo: 'New York',
          iconPath: MyIcons.food1,
          contactName: 'Shokhruh',
          contactNumber: '+99 877 32 877 77'),
    );

    return myContactsInfo;
  }
}
