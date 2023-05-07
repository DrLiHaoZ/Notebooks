class Contact extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            password :'hello',
            authorization : false
        };
        this.authorize = this.authorize.bind(this);
    }

    authorize(e){
        let password = e.target.querySelector('input[type="password"]').value;
        let auth = password == this.state.password;
        this.setState({authorization:auth});
    }

    render(){

        let login = <form action="#" onSubmit={this.authorize}>
                        <input type="password" placeholder="password"></input>
                        <input type="submit"></input>
                    </form>;
        
        let contactInfo =  <ul>
                                <li> client@example.com</li>
                                <li> 555.555.5555 </li>
                            </ul>
        

        return (
            <div id="authorization">
               <h1>{this.state.authorization? contactInfo : login}</h1>
            </div>
        );
    }
}


const container = document.getElementById('root');
const root = ReactDOM.createRoot(container);
root.render(<Contact/>);