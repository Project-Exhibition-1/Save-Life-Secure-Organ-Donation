import React from "react";
import "../Css/styles.css";
import Navbar from "./Navbar";
import Carousel from "./Carousel";
import Login from "./Login";
import Donor from "./Donor";
import Reciever from "./Reciever";
import Web3 from "web3";

function App() {
  return (
    <div>
      <Navbar />
      <Carousel />
      <div class="d-grid gap-2 col-6 mx-auto">
        <button class="btn btn-danger btn-lg" type="button">
          Are you a Patient
        </button>
        <button class="btn btn-danger btn-lg " type="button">
          Are you a Donor
        </button>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script type="text/javascript">
        if (typeof web3 !=='undefined'){
            web3=new Web3(web3.currentProvider);
        }
        else{
            web3=new Web3(new Web3.providers.HttpProvider("http://localhost:7545"));
        }
        web3.eth.defaultaccount=web3.eth.accounts[0];
        var OrganDonationContract=web3.eth(abi);
        var SimpleStorage=OrganDonationContract.at('0xd9145CCE52D386f254917e481eB44e9943F39138');
    </script>


    
  );
}

export default App;