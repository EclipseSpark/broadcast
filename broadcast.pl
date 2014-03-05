#+----------------------------------------------------+
#|     FrozenBox MAINFRAME Broadcast Chat System      |
#|                                                    |
#|    software written by EclipseSpark                |
#|                                                    |
#|              FrozenBox network                     |
#|               www.frozenbox.org                    |
#|                                                    |
#| This software is under GNU/GPL license             |
#|        and is 100% Free Software!!                 |
#+----------------------------------------------------+

#!/usr/bin/perl
use Term::ANSIColor;

my $messagefile = "/usr/share/broadcast/database.dat";
my $user = getlogin();
sub clear()
{
   system("clear");
}

clear();
print color "red";
print("welcome to MAINFRAME broadcast chat \n");
print color "reset";
menu();

sub menu()
{
   print color "blue";
      print("1 - send a message \n");
      print("2 - read messages \n");
      print("\n0 - exit\n");
   print color "green";
   print("&>");
   print color "white";
      my $menu = <STDIN>;
      if($menu == 1)
     {
      clear();
            sendmessage();
      }
      elsif($menu == 2)
      {
      clear();
            readmessage();
      }
      elsif($menu == 0)
      {
      print color "reset";
      clear();
      exit 0;
      }
      else
      {
      clear();
      print color "red";
            print("invalid input \n");
            menu();
      }
}

sub sendmessage()
{
   print color "blue";
      print("insert message:\n");
   print color "red";
   print("&>");
   print color "green";
      my $message = <STDIN>;
         my $text = "$user\t".(localtime)."  >> \n $message";

         open FILE, ">>", $messagefile or die $!;
         print FILE $text;
         close FILE;
   clear();

      menu();
}

sub readmessage()
{
      open FILE, "<", $messagefile or die $!;
      my @lines = <FILE>;
      my $c = 1;
      foreach(@lines)
      {
      if($c == 1)
      {
         print color "red";
         $c = 2;
      }
      else
      {
         print color "green";
         $c = 1;
      }
            print $_;
      }
      close FILE;

   menu();
}
