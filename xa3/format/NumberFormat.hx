package xa3.format;

import Std.parseFloat;
import Std.string;

class NumberFormat {

	public static function numberEmptyIfZero( v:Float, decimals = 0, decimalSeparator = ".", thousandsSeparator = "," ):String {
		return v == 0 ? "" : number( v, decimals, decimalSeparator, thousandsSeparator );
	}

	public static function number( v:Float, decimals = 0, decimalSeparator = ".", thousandsSeparator = ",", minWholeNumbers = 1 ):String {
		
		if( v == 0 && minWholeNumbers == 0 ) return "";

		final vRounded = round( v, decimals );
		final vString = string( vRounded );
		final decimalString = vString.indexOf( "." ) == -1 ? "" : vString.split( "." )[1];
		final filledDecimal = fillRight( decimalString, decimals );
		
		final sign = vRounded < 0 ? "-" : "";
		final wholeNumbers = vString.split( "." )[0].substring( vRounded < 0 ? 1 : 0 );
		final left = fillLeft( wholeNumbers, minWholeNumbers );
		final right = decimals > 0 ? decimalSeparator + filledDecimal : "";

		var formattedLeft = left.substr( Std.int( Math.max( 0, left.length - 3 )));
		final separators = Std.int(( left.length - 1 ) / 3 );
		for( i in 0...separators ) {
			formattedLeft = left.substring( left.length - ( i + 2 ) * 3, left.length -( i + 1 ) * 3 ) + thousandsSeparator + formattedLeft;
		}

		return sign + formattedLeft + right;
	}

	public static function fixed( v:Float, decimals = 0, decimalSeparator = ".", minWholeNumbers = 1 ):String {
		
		if( v == 0 && minWholeNumbers == 0 ) return "";

		final vRounded = round( v, decimals );
		final vString = string( vRounded );
		final wholeNumbers = vString.split( "." )[0];
		final left = fillLeft( wholeNumbers, minWholeNumbers );

		final decimalString = vString.indexOf( "." ) == -1 ? "" : vString.split( "." )[1];
		final filledDecimal = fillRight( decimalString, decimals );

		final right = decimals > 0 ? decimalSeparator + filledDecimal : "";

		return left + right;
	}

	public static function percent( v:Float, decimalSeparator = ".", thousandsSeparator = "," ):String {
		
		final p = v * 100;
		return number( p, getDecimalDigits( p ), decimalSeparator, thousandsSeparator ) + "%";
	}
	
	public static function getDecimalDigits( v:Float ):Int {
		final vString = string( v );
		if( vString.indexOf( "." ) == -1 ) return 0;
		return vString.split( "." )[1].length;
	}
	
	public static function round( v:Float, decimals:Int ):Float {

		final pow = Math.pow( 10, decimals );
		final stringV = string( v );
		
		if( stringV.indexOf( "e" ) != -1 ) { // do standard rounding
			
			return Math.round( v * pow ) / pow;

		} else { // do string rounding that also works with very big numbers and many decimals
			
			final stringVParts = stringV.split( "." );
			final sInt = stringVParts[0];
			final sDec = stringVParts.length == 2 ? stringVParts[1] : "";
			if( sDec.length <= decimals ) return v;
			
			final v = Std.parseInt( sDec.charAt( decimals ));
			if( v < 5 ) return parseFloat( '${sInt}.${sDec.substr( 0, decimals )}' );

			var sUp = "0";
			for( i in 1...sDec.length ) {
				final v = Std.parseInt( sDec.charAt( decimals - i ));
				final vUp = v + 1;
				if( vUp < 10 ) {
					sUp = string( vUp ) + sUp;
					return parseFloat( '${sInt}.${sDec.substring( 0 , decimals - i )}$sUp' );
				} else {
					sUp += "0";
				}
			}
			final int = parseFloat( sInt );
			final intUp = int < 0 ? int -1 : int + 1;
			return intUp;
		}

	}
	
	static function fillLeft( s:String, length:Int ):String {
		while( s.length < length ) s = "0" + s;
		return s;
	}

	static function fillRight( s:String, length:Int ):String {
		while( s.length < length ) s += "0";
		return s;
	}

}