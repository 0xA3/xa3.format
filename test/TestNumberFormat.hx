package test;

import xa3.format.NumberFormat;
using buddy.Should;

class TestNumberFormat extends buddy.BuddySuite {

	public function new() {
		
		describe( "Test rounding", {
			it( "Test 27.66", { NumberFormat.round( 27.66, 2 ).should.be( 27.66 ); });
			it( "Test 15000000.12345", { NumberFormat.round( 15000000.123451, 5 ).should.be( 15000000.12345 ); });
			it( "Test -27.66", { NumberFormat.round( -27.66, 2 ).should.be( -27.66 ); });
			it( "Test 1.6614729592134835e-011 ", { NumberFormat.round( 1.6614729592134835e-011, 0 ).should.be( 0 ); });
			it( "Test 2.47", { NumberFormat.round( 2.47, 2 ).should.be( 2.47 ); });
			it( "Test -2.47", { NumberFormat.round( -2.47, 2 ).should.be( -2.47 ); });
		});

		describe( "Test Fixed", {
			it( "Test 0", {	NumberFormat.fixed( 0 ).should.be( "0" ); });
			it( "Test 0.00", { NumberFormat.fixed( 0, 2 ).should.be( "0.00" ); });
			it( "Test 1.00", { NumberFormat.fixed( 1, 2 ).should.be( "1.00" ); });
			it( "Test 1.2", { NumberFormat.fixed( 1.2, 1 ).should.be( "1.2" ); });
			it( "Test 27.66", { NumberFormat.fixed( 27.66, 2 ).should.be( "27.66" ); });
			it( "Test 127.7", { NumberFormat.fixed( 127.66, 1 ).should.be( "127.7" ); });
			it( "Test 10000", { NumberFormat.fixed( 10000, 0 ).should.be( "10000" ); });
			it( "Test 12345.679", { NumberFormat.fixed( 12345.679, 3 ).should.be( "12345.679" ); });
			it( "Test 15000000.00000", { NumberFormat.fixed( 15000000, 5 ).should.be( "15000000.00000" ); });
			it( "Test -1.00", { NumberFormat.fixed( -1, 2 ).should.be( "-1.00" ); });
			it( "Test -1.2", { NumberFormat.fixed( -1.2, 1 ).should.be( "-1.2" ); });
			it( "Test -10000", { NumberFormat.fixed( -10000, 0 ).should.be( "-10000" ); });
			it( "Test -12345.679", { NumberFormat.fixed( -12345.679, 3 ).should.be( "-12345.679" ); });
			it( "Test empty", { NumberFormat.fixed( 0, 0, 0 ).should.be( "" ); });
			it( "Test 00", { NumberFormat.fixed( 0, 0, 2 ).should.be( "00" ); });
			it( "Test 2.4699006514421993", { NumberFormat.fixed( 2.4699006514421993, 2 ).should.be( "2.47" ); });
		});
		
		describe( "Test number", {
			it( "Test 0", {	NumberFormat.number( 0 ).should.be( "0" ); });
			it( "Test 0.00", { NumberFormat.number( 0, 2 ).should.be( "0.00" ); });
			it( "Test 0.0000001 ", { NumberFormat.number( 0.0000001, 2 ).should.be( "0.00" ); });
			it( "Test 1.00", { NumberFormat.number( 1, 2 ).should.be( "1.00" ); });
			it( "Test 1.2", { NumberFormat.number( 1.2, 1 ).should.be( "1.2" ); });
			it( "Test 1.3", { NumberFormat.number( 1.25111, 1 ).should.be( "1.3" ); });
			it( "Test 27.66", { NumberFormat.number( 27.661, 2 ).should.be( "27.66" ); });
			it( "Test 127.7", { NumberFormat.number( 127.66, 1 ).should.be( "127.7" ); });
			it( "Test 1,227.334", { NumberFormat.number( 1227.3336, 3 ).should.be( "1,227.334" ); });
			it( "Test 10,000", { NumberFormat.number( 10000, 0 ).should.be( "10,000" ); });
			it( "Test 100,000,000.00", { NumberFormat.number( 100000000, 2 ).should.be( "100,000,000.00" ); });
			it( "Test 12,345,679", { NumberFormat.number( 12345.679, 3 ).should.be( "12,345.679" ); });
			it( "Test -0.0000001 ", { NumberFormat.number( -0.0000001, 2 ).should.be( "0.00" ); });
			it( "Test -0.012 ", { NumberFormat.number( -0.012, 2 ).should.be( "-0.01" ); });
			it( "Test -1.00", { NumberFormat.number( -1, 2 ).should.be( "-1.00" ); });
			it( "Test -1.2", { NumberFormat.number( -1.2, 1 ).should.be( "-1.2" ); });
			it( "Test -27.66", { NumberFormat.number( -27.661, 2 ).should.be( "-27.66" ); });
			it( "Test -127.7", { NumberFormat.number( -127.66, 1 ).should.be( "-127.7" ); });
			it( "Test -1,000,000", { NumberFormat.number( -1000000, 0 ).should.be( "-1,000,000" ); });
			it( "Test -12,345.679", { NumberFormat.number( -12345.679, 3 ).should.be( "-12,345.679" ); });
			it( "Test 1.6614729592134835e-011 ", { NumberFormat.number( 1.6614729592134835e-011 ).should.be( "0" ); });
			it( "Test empty", { NumberFormat.number( 0, 0, 0 ).should.be( "" ); });
			it( "Test 00", { NumberFormat.number( 0, 0, 2 ).should.be( "00" ); });
		});
		
		describe( "Test getDecimalDigits", {
			it( "Test 0", { NumberFormat.getDecimalDigits( 0 ).should.be( 0 ); });
			it( "Test 1", { NumberFormat.getDecimalDigits( 1 ).should.be( 0 ); });
			it( "Test 0.1", { NumberFormat.getDecimalDigits( 0.1 ).should.be( 1 ); });
			it( "Test 0.01", { NumberFormat.getDecimalDigits( 0.01 ).should.be( 2 ); });
			it( "Test 60", { NumberFormat.getDecimalDigits( 60 ).should.be( 0 ); });
			it( "Test 0", { NumberFormat.getDecimalDigits( 0 ).should.be( 0 ); });
			it( "Test -1", { NumberFormat.getDecimalDigits( -1 ).should.be( 0 ); });
			it( "Test -0.1", { NumberFormat.getDecimalDigits( -0.1 ).should.be( 1 ); });
			it( "Test -0.01", { NumberFormat.getDecimalDigits( -0.01 ).should.be( 2 ); });
			it( "Test -60", { NumberFormat.getDecimalDigits( -60 ).should.be( 0 ); });
		});

	}
}