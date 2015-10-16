#include<iostream>
#include<fstream>
#include<string>
#include<vector>
using namespace std;
int main()
{
    cout<< "please provide the name of the file containing the data"<<endl;
    cout<<"otherwise we will create a new file with the name you entered"<<endl;
    cout<<" please enter the name of the datafile, if not exist it will be created"<<endl;
    cout<<"please follow the format ID, name,SSN,major,age,gender,address,GPA"<<endl;
    cout<<"1 for file info, 2 to add entry, 3 to delete entry,4 for entry update,"<<endl;
    string filename;
    fstream data;
    int SSN,ID, age;
    double GPA;
    vector<string> student;
    char line[256];
    string name, major, gender, address;
    int num;
    string info;
    cout<<"please enter a file name"<<endl;
    cin>>filename;
    cout<<"please choose an option"<<endl;
    cin>>num;
    switch(num)
    {
    case 1:
        cout<<"this is to display info"<<endl;
        data.open(filename.c_str());

        while(data.getline(line,256,'/n'))
        {

            cout<<line;

        }
        data.close();
        break;

    case 2:
        cout<<"please enter the new student information"<<endl;
        data.open(filename.c_str(),fstream::app|fstream::out);
        //cin>>name>>ID>>SSN>>major>>age>>gender>>address>>GPA;
        //data<<name<<'\t'<< ID<<'\t'<<SSN<<'\t'<<major<<'\t'<<age<<'\t'<<gender<<'\t'<<address<<'\t'<<GPA<<endl;
        cin.ignore();
        getline (cin, info);
        data<<info<<endl;
        data.close();
        break;
    case 3:
    {
        string temp;
        data.open(filename.c_str(),fstream::app|fstream::out|fstream::in);
        while( !data.eof() )
        {
            getline(data, temp);
            student.push_back(temp);
        }
        data.close();


// get everything from the file and store it to vector
        string sid;

        cout << "Please enter the student id of the student that you want to delete"<<endl;
        cin.ignore();
        getline(cin, sid);

        for(int i = 0; i < (int)student.size(); ++i)
        {
            if(student[i].substr(0, sid.length()) == sid)
            {

                student.erase(student.begin() + i);
                cout << "data erased!"<< endl;
                i = 0; // Reset
            }
        }


        ofstream ndata(filename.c_str(), ios::out | ios::trunc);

        for(vector<string>::const_iterator i = student.begin(); i != student.end(); ++i)
        {
            ndata<< *i << endl;
        }
        ndata.close();
        break;
    }
    case 4:
    {
        cout<<"this is to update a student's information"<<endl;
        data.open(filename.c_str(),fstream::app|fstream::out|fstream::in);
        string temup;
        while( !data.eof() )
        {
            getline(data, temup);
            student.push_back(temup);
        }
        data.close();
        string sid;
        string newSid;

        cout << "Please enter the student id of the student that you want to update"<<endl;
        cin.ignore();
        getline(cin, sid);
        cout<<"please enter the new student information"<<endl;
//cin.ignore();
        getline(cin,newSid);

        for(int i = 0; i < (int)student.size(); ++i)
        {
            if(student[i].substr(0, sid.length()) == sid)
            {

                student.erase(student.begin() + i);
                student.insert(student.begin()+i,newSid);

                cout << "data updated!"<< endl;
                i = 0; // Reset
            }
        }


        ofstream updata(filename.c_str(), ios::out | ios::trunc);

        for(vector<string>::const_iterator i = student.begin(); i != student.end(); ++i)
        {
            updata<< *i << endl;
        }
        updata.close();
        break;
    }




    default :
        cout<<"error"<<endl;
        break;
    }


}
