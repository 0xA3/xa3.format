package test;

import xa3.format.NumberFormat;
using buddy.Should;

class TestNumberFormatCustom extends buddy.BuddySuite {

	public function new() {
		
		describe( "Test Fixed Custom", {

			it( "Test 0", {	NumberFormat.fixed( 0, 0, NumberFormat.de ).should.be( "0" ); });
			it( "Test 0,00", { NumberFormat.fixed( 0, 2, NumberFormat.de ).should.be( "0,00" ); });
			it( "Test 1,00", { NumberFormat.fixed( 1, 2, NumberFormat.de ).should.be( "1,00" ); });
			it( "Test 1,2", { NumberFormat.fixed( 1.2, 1, NumberFormat.de ).should.be( "1,2" ); });
			it( "Test 27,66", { NumberFormat.fixed( 27.66, 2, NumberFormat.de ).should.be( "27,66" ); });
			it( "Test 127,7", { NumberFormat.fixed( 127.66, 1, NumberFormat.de ).should.be( "127,7" ); });
			it( "Test 10000", { NumberFormat.fixed( 10000, 0, NumberFormat.de ).should.be( "10000" ); });
			it( "Test 12345,679", { NumberFormat.fixed( 12345.679, 3, NumberFormat.de ).should.be( "12345,679" ); });
			it( "Test 15000000,00000", { NumberFormat.fixed( 15000000, 5, NumberFormat.de ).should.be( "15000000,00000" ); });

			it( "Test -1,00", { NumberFormat.fixed( -1, 2, NumberFormat.de ).should.be( "-1,00" ); });
			it( "Test -1,2", { NumberFormat.fixed( -1.2, 1, NumberFormat.de ).should.be( "-1,2" ); });
			it( "Test -10000", { NumberFormat.fixed( -10000, 0, NumberFormat.de ).should.be( "-10000" ); });
			it( "Test -12345,679", { NumberFormat.fixed( -12345.679, 3, NumberFormat.de ).should.be( "-12345,679" ); });
			
		});
		
		describe( "Test number with separator constant", {

			it( "Test 0", {	NumberFormat.number( 0 ).should.be( "0" ); });
			it( "Test 0,00", { NumberFormat.number( 0, 2, NumberFormat.de ).should.be( "0,00" ); });
			it( "Test 1,00", { NumberFormat.number( 1, 2, NumberFormat.de ).should.be( "1,00" ); });
			it( "Test 1,2", { NumberFormat.number( 1.2, 1, NumberFormat.de ).should.be( "1,2" ); });
			it( "Test 1,3", { NumberFormat.number( 1.25111, 1, NumberFormat.de ).should.be( "1,3" ); });
			it( "Test 27,66", { NumberFormat.number( 27.661, 2, NumberFormat.de ).should.be( "27,66" ); });
			it( "Test 127,7", { NumberFormat.number( 127.66, 1, NumberFormat.de ).should.be( "127,7" ); });
			it( "Test 1.227,334", { NumberFormat.number( 1227.3336, 3, NumberFormat.de ).should.be( "1.227,334" ); });
			it( "Test 10.000", { NumberFormat.number( 10000, 0, NumberFormat.de ).should.be( "10.000" ); });
			it( "Test 100.000.000,00", { NumberFormat.number( 100000000, 2, NumberFormat.de ).should.be( "100.000.000,00" ); });
			it( "Test 12.345,679", { NumberFormat.number( 12345.679, 3, NumberFormat.de ).should.be( "12.345,679" ); });

			it( "Test -1,00", { NumberFormat.number( -1, 2, NumberFormat.de ).should.be( "-1,00" ); });
			it( "Test -1,2", { NumberFormat.number( -1.2, 1, NumberFormat.de ).should.be( "-1,2" ); });
			it( "Test -27,66", { NumberFormat.number( -27.661, 2, NumberFormat.de ).should.be( "-27,66" ); });
			it( "Test -127,7", { NumberFormat.number( -127.66, 1, NumberFormat.de ).should.be( "-127,7" ); });
			it( "Test -1.000.000", { NumberFormat.number( -1000000, 0, NumberFormat.de ).should.be( "-1.000.000" ); });
			it( "Test -12.345,679", { NumberFormat.number( -12345.679, 3, NumberFormat.de ).should.be( "-12.345,679" ); });
		});

		describe( "Test number with custom separator", {

			it( "Test -1.000.000", { NumberFormat.number( -1000000.50, 2, { decimal: ",", thousands: "." }).should.be( "-1.000.000,50" ); });
		});
	}
}