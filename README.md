ConnectiCoin Project
===================================== 
![](share/pixmaps/bitcoin128.png)
 
---------------- 
What is Connecticoin?
----------------

Connecticoin is another version of Litecoin and Bitcoin using scrypt as a proof-of-work algorithm.
Connecticoin offers a lower transaction fee, requires more blocks to mint coins, and adjusts difficulty more frequently than LTC and BTC.
Fees were lowered to help our users scale this project without having to worry about escalating fees.
Blocks for minting were increased to prevent non users of the coin from mining the coin only to dump or withhold them from the community.
Difficulty adjusts more frequently to avoid huge gaps of time between block generation and prevent hashing attacks. 
 - 0.5 minute block targets
 - Block Rewards Halved every 3.2 Million blocks (~3 years)
 - 32 million total coin supply

Mining rewards.
 - 5 coins per block. 
 - 258 blocks to retarget difficulty.
 - Coins need 2000 blocks to mature.

For more information, as well as an immediately useable, binary version of
the Connecticoin client sofware, see http://www.connecticoin.com

License
-------

Connecticoin is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.

Development process
-------------------

Join our Discord - https://discord.com/invite/zzUfpFDnGS

Developers work in their own trees, then submit pull requests when they think
their feature or bug fix is ready.

If it is a simple/trivial/non-controversial change, then one of the Connecticoin
development team members simply pulls it.

If it is a *more complicated or potentially controversial* change, then the patch
submitter will be asked to start a discussion with the devs and community.

The patch will be accepted if there is broad consensus that it is a good thing.
Developers should expect to rework and resubmit patches if the code doesn't
match the project's coding conventions (see `doc/coding.txt`) or are
controversial.

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/connecticoin/connecticoin/tags) are created
regularly to indicate new official, stable release versions of Connecticoin.

Testing
-------

Testing and code review is the bottleneck for development; we get more pull
requests than we can review and test. Please be patient and help out, and
remember this is a security-critical project where any mistake might cost people
lots of money.

### Automated Testing

Developers are strongly encouraged to write unit tests for new code, and to
submit new unit tests for old code.

Unit tests for the core code are in `src/test/`. To compile and run them:

    cd src; make -f makefile.unix test

Unit tests for the GUI code are in `src/qt/test/`. To compile and run them:

    qmake BITCOIN_QT_TEST=1 -o Makefile.test bitcoin-qt.pro
    make -f Makefile.test
    ./connecticoin-qt_test
