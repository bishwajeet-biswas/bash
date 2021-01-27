
#!/bin/bash

components="bot-3-1cnmri7umu9kbijxbdnx7ayfz5r-1
bot-no-data-bo-1dmw7p301abfmgusbewnaqcqdiq-1
bot-smalltalk--1d5cnkoharkuytidstswqf5bhcr-1
bot-swapnil-1erbcwgmjcw1pzmi4trw5ghtyg6-1
bot-tarun-1d6upg0nxgukca5fujtkqd2sluu-1
bot-ttwtewewev-1dx5w9w2la2zhbf0fdhk8ti3bjb-1
bot-utilhalt-1e2b0xzdkr2d7mvoszmciu9fkgj-1
bot-vehicle-1drj2zkqxfibmrjkagcw8tlwnwj-1
chatbot-testing-1bcipa6dev1s8fgebzsjbxzhi57-1
chatbot-testing-1bcwe9foqufgtpr8ewiudkum7fb-1
chatbot-testing-1bcwl2ikgg4pbvwwnit1sj0xchs-1
chatbot-testing-1bcwpgbf1hx5s8eahbtxftlihp1-1
chatbot-testing-1bf8qutdgez69cugv1jswspnwfy-1
chatbot-testing-1c4wnlyb7mzbi72gpegee71rgju-1
chatbot-testing-1c9vhab8hb7xu2ypliu8rtmtmwh-1
chatbot-testing-1cactkdlpxpnx8o62ekzmwkhcs2-1
chatbot-testing-1zbhibglr6kelj39nddtbdi9bx7-1"

for i in $components
    do
   
        kubectl set image deploy $i middleware=gcr.io/kbbot-217410/stage-mdw-1:081bd3f5bb4e144464127d0e45ab192724ef7138 -n stage
        echo
    done

