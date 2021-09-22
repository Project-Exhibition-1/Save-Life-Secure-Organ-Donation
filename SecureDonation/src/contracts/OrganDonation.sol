pragma solidity >=0.4.21 <0.6.0;

contract OrganDonation {
    string public name="SecureOrganDonation";
    uint public donorCount=0;
    uint public patientCount=0;

    mapping(uint=>Donor) public donors;
    mapping(uint=>Patient) public patients;

    struct Donor {
        uint donor_id;
        string firstName;
        string lastName;
        string hospitalDoc;
        string bloodGroup;
        string height;
        string weight;
        address payable uploader;
    }
    struct Patient {
        uint patient_id;
        string firstname;
        string lastname;
        string bloodGroup;
        string height;
        string weight;
        string hospitalDoc;
        address payable uploader;
    }

    event DonorUploaded(
        uint donor_id,
        string firstName,
        string lastName,
        string bloodGroup,
        string height,
        string weight,
        address payable uploader
    );
    event PatientUploaded(
        uint patient_id,
        string firstname,
        string lastname,
        string bloodGroup,
        string height,
        string weight,
        address payable uploader
    );

    constructor() public{

    }

    function validateMedicalRecord(string memory _hospitalDoc) public pure returns (bool) {
        if (bytes(_hospitalDoc).length > 0) {
            bool _clearance = true;
            return _clearance;
        }
    }
    function addPatient(string memory _firstname, string memory _lastname, string memory _hospitalDoc,string memory _bloodGroup, string memory _height, string memory _weight) public {
    
        require(bytes(_firstname).length > 0);
        require(bytes(_lastname).length > 0);
        require(bytes(_bloodGroup).length > 0);
        require(bytes(_height).length > 0);
        require(bytes(_weight).length > 0);
        
        bool _clearance = validateMedicalRecord(_hospitalDoc);
        
        if (_clearance && bytes(_firstname).length > 0 && bytes(_lastname).length > 0 && bytes(_hospitalDoc).length > 0 && bytes(_bloodGroup).length > 0 && bytes(_height).length > 0 && bytes(_weight).length > 0) {
            patientCount++;
            patients[patientCount] = Patient(patientCount, _firstname, _lastname, _hospitalDoc, _bloodGroup, _height, _weight,msg.sender);
        }
        emit PatientUploaded(patientCount, _firstname, _lastname, _bloodGroup, _height, _weight,msg.sender);
    }

    function addDonor(string memory _firstname, string memory _lastname, string memory _hospitalDoc,string memory _bloodGroup, string memory _height, string memory _weight) public {
    
        require(bytes(_firstname).length > 0);
        require(bytes(_lastname).length > 0);
        require(bytes(_bloodGroup).length > 0);
        require(bytes(_height).length > 0);
        require(bytes(_weight).length > 0);
        
        bool _clearance = validateMedicalRecord(_hospitalDoc);
        
        if (_clearance && bytes(_firstname).length > 0 && bytes(_lastname).length > 0 && bytes(_hospitalDoc).length > 0 && bytes(_bloodGroup).length > 0 && bytes(_height).length > 0 && bytes(_weight).length > 0) {
            donorCount++;
            donors[donorCount] = Donor(donorCount, _firstname, _lastname, _hospitalDoc, _bloodGroup, _height, _weight,msg.sender);
        }
        emit DonorUploaded(donorCount, _firstname, _lastname, _bloodGroup, _height, _weight,msg.sender);
    }
}