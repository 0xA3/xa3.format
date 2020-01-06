package xa3.format;

using StringTools;
using DateTools;

class DateFormat {
	
	public static function javaSimpleDate( d:Date, format:String ) {
		var p = format.replace( "yyyy", "%Y" );
		p = p.replace( "yy", "%y" );
		p = p.replace( "MM", "%m" );
		p = p.replace( "M", "%m" );
		p = p.contains( "dd" ) ? p.replace( "dd", "%d" ) : p.replace( "d", "%d" );
		p = p.replace( "HH", "%H" );
		p = p.replace( "mm", "%M" );
		p = p.replace( "ss", "%S" );
		return d.format( p );
	}
}