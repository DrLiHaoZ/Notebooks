class Contact extends React.Component{
    render(){
        return (
            <div>
                <ul>
                    <li> client@example.com</li>
                    <li> 555.555.5555 </li>
                </ul>
            </div>
        );
    }
}


const container = document.getElementById('root');
const root = ReactDOM.createRoot(container);
root.render(<Contact/>);