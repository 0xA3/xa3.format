package xa3.format;

import Std.parseFloat;
import Std.string;

typedef Separation = {
	final decimal:String;
	final thousands:String;
}

class NumberFormat {

	public static final dotComma:Separation = { decimal: ".", thousands: "," };
	public static final commaDot:Separation = { decimal: ",", thousands: "." };

	public static final de = commaDot;
	public static final en = dotComma;
	public static final fr:Separation = { decimal: ",", thousands: " " }

	/**
	 * Returns an empty string if the number is 0. If it's not empty it formats the number with the 'number method
	 */
	public static function numberEmptyIfZero( v:Float, decimals = 0, ?separation:Separation ):String {
		return v == 0 ? "" : number( v, decimals, separation );
	}

	/**
	 * Formats the number with decimal and thousands separator. Returns a String
	 */
	public static function number( v:Float, decimals = 0, ?separation:Separation, ?minWholeNumbers = 1 ):String {

		if( v == 0 && minWholeNumbers == 0 ) return "";
		if( separation == null ) separation = en;

		final vRounded = round( v, decimals );
		final vString = string( vRounded );
		final decimalString = vString.indexOf( "." ) == -1 ? "" : vString.split( "." )[1];
		final filledDecimal = fillRight( decimalString, decimals );
		
		final sign = vRounded < 0 ? "-" : "";
		final wholeNumbers = vString.split( "." )[0].substring( vRounded < 0 ? 1 : 0 );
		final left = fillLeft( wholeNumbers, minWholeNumbers );
		final right = decimals > 0 ? separation.decimal + filledDecimal : "";

		var formattedLeft = left.substr( Std.int( Math.max( 0, left.length - 3 )));
		final separators = Std.int(( left.length - 1 ) / 3 );
		for( i in 0...separators ) {
			formattedLeft = left.substring( left.length - ( i + 2 ) * 3, left.length -( i + 1 ) * 3 ) + separation.thousands + formattedLeft;
		}

		return sign + formattedLeft + right;
	}

	/**
	 * Formats the number only with decimal separator. Returns a String
	 */
	public static function fixed( v:Float, decimals = 0, ?separation:Separation, ?minWholeNumbers = 1 ):String {
		
		if( v == 0 && minWholeNumbers == 0 ) return "";
		if( separation == null ) separation = en;

		final vRounded = round( v, decimals );
		final vString = string( vRounded );
		final wholeNumbers = vString.split( "." )[0];
		final left = fillLeft( wholeNumbers, minWholeNumbers );

		final decimalString = vString.indexOf( "." ) == -1 ? "" : vString.split( "." )[1];
		final filledDecimal = fillRight( decimalString, decimals );

		final right = decimals > 0 ? separation.decimal + filledDecimal : "";

		return left + right;
	}

	/**
	 * Formats the number to percent value. ( 1 == 100% )
	 */
	 public static function percent( v:Float, ?separation:Separation ):String {
		if( separation == null ) separation = en;
		final p = v * 100;
		return number( p, getDecimalDigits( p ), separation ) + "%";
	}
	
	public static function getDecimalDigits( v:Float ):Int {
		final vString = string( v );
		if( vString.indexOf( "." ) == -1 ) return 0;
		return vString.split( "." )[1].length;
	}
	
	/**
	 * Rounds the number
	 */
	 public static function round( v:Float, decimals = 0 ):Float {

		if( decimals == 0 ) return Math.round( v );

		final stringV = string( v );
		
		if( stringV.indexOf( "e" ) != -1 ) { // do standard rounding
			final pow = Math.pow( 10, decimals );
			return Math.round( v * pow ) / pow;

		} else { // do string rounding that also works with very big numbers and many decimals
			
			final stringVParts = stringV.split( "." );
			final sInt = stringVParts[0];
			final sDec = stringVParts.length == 2 ? stringVParts[1] : "";
			if( sDec.length <= decimals ) return v;
			
			final v = Std.parseInt( sDec.charAt( decimals ));
			if( v < 5 ) return parseFloat( '${sInt}.${sDec.substr( 0, decimals )}' );

			var sUp = "0";
			for( i in 1...decimals + 1 ) {
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