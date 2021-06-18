import 'package:flutter/material.dart';
import 'package:health_solution_app/model/drug.dart';
import 'package:health_solution_app/widgets/customtext.dart';
import 'package:health_solution_app/widgets/customtext2.dart';

class DrugLibrary extends StatefulWidget {
  const DrugLibrary({Key key}) : super(key: key);

  @override
  _DrugLibraryState createState() => _DrugLibraryState();
}

class _DrugLibraryState extends State<DrugLibrary> {
  
  
  List<Drug> _drugModel = [
    Drug(
      drugName: "Paracetamol, 100 mg",
      prescription: "2 capsules with lunch",
      id: 0,
      isSelected: false,
    ),
    Drug(
      drugName: "Lonart Coartem, 200mmg",
      prescription: "1 pill, 10 min before dinner",
      id: 1,
      isSelected: false,
    ),
    Drug(
      drugName: "Flagyl, 50 mg",
      prescription: "1 pill after meal",
      id: 2,
      isSelected: false,
    ),
    Drug(
      drugName: "Ampiclox, 100 mg",
      prescription: "2 capsules with lunch",
      id: 3,
      isSelected: false,
    ),
    Drug(
      drugName: "Penicillin, 100 mg",
      prescription: "2 capsules with dinner",
      id: 4,
      isSelected: false,
    ),
    Drug(
      drugName: "Arthemether, 150 mg",
      prescription: "4 pills with dinner",
      id: 5,
      isSelected: false,
    ),
    Drug(
      drugName: "EyeDrop, 50 mg",
      prescription: "After bath",
      id: 6,
      isSelected: false,
    ),
    Drug(
      drugName: "Procold, 20 mg",
      prescription: "2 capsules with meal",
      id: 7,
      isSelected: false,
    ),
    Drug(
      drugName: "AntiBiotics, 100 mg",
      prescription: "2 capsules with lunch",
      id: 8,
      isSelected: false,
    ),
    Drug(
      drugName: "Anti Malaria 500 mg",
      prescription: "2 capsules with lunch",
      id: 9,
      isSelected: false,
    ),
  ];

  List<Drug> selectedDrugs = List();
  // bool _selectedDrugIcon = false;
  Widget _buildDrugBoxes(
      String drugName, String prescription, int index, bool isSelected) {
    return ListTile(
      title: CustomText(
        text: drugName,
        size: 18,
        color: Colors.black,
        weight: FontWeight.bold,
      ),
      subtitle: CustomText2(
        text: prescription,
        size: 14,
        color: Colors.black45,
        weight: FontWeight.w500,
      ),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Colors.green[700],
            )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
            
      onTap: () {
        setState(() {
          _drugModel[index].isSelected = !_drugModel[index].isSelected;
          if (_drugModel[index].isSelected == true) {
            selectedDrugs.add(Drug(
                drugName: drugName,
                prescription: prescription,
                isSelected: true));
          } else if (_drugModel[index].isSelected == false) {
            selectedDrugs.removeWhere(
                (element) => element.drugName == _drugModel[index].drugName);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText2(
                          text: "Drug",
                          size: 30,
                          color: Colors.black87,
                        ),
                        CustomText2(
                          text: "Library",
                          size: 30,
                          color: Colors.black,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _drugModel.length,
                      itemBuilder: (_, index) {
                        return _buildDrugBoxes(
                            _drugModel[index].drugName,
                            _drugModel[index].prescription,
                            index,
                            _drugModel[index].isSelected);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(5),
              ),
              child: CustomText2(
                text: "Collate",
                size: 18,
                color: Colors.white,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
