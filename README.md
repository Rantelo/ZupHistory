#ZupHistory
Don't you feel upset when you email your WhatsApp conversation history and it doesn't look as pretty and understandable as displayed on the phone

- ###What is this?
ZupHistory is a script that generates an html view of your WhatsApp conversation?

- ###How to use it?
    1. **Download a WhatsApp conversation** 
    Click on Menu > More > Email conversation
    
    2. **Clone this repository**
You may also want to place your emailed conversation (.txt file) inside the cloned folder.
    3. **Execute the script**
    The execution of this script is pretty simple. Just need to run *zup_html_generator.rb* with two arguments:
    ```sh
    $ ruby zup_html_generator.rb <text_file> <your_name>
    ```
    The template.html (available in this repository) was generated using the template.txt file and my name as follows: 
    ```sh
    $ ruby zup_html_generator.rb "template.txt" "roberto"
    ```
    4. **Open html file in a browser and enjoy the memories**

- ###General Considerations **(things to work on...)**
    1. **Your phone should be configured in english**
    If it is not, you may want to change message.rb months array to the abbreviation your language uses
    2. **Dates are handled but not displayed yet**
    Also, when a conversation contain messages from different years, the format may change. Need to be considered for future updates
    3. **Groups conversations are not yet supported**
