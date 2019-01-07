/*
* Copyright (c) 2011-2018 Darren Haynes (https://yourwebsite.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Darren Haynes <darren@example.com>
*/

public class MyApp : Gtk.Application {

    public MyApp () {
        Object (
            application_id: "com.github.darren-haynes.",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new Gtk.ApplicationWindow (this);
        //  var grid = new Gtk.Grid ();
        //  grid.orientation = Gtk.Orientation.VERTICAL; 
        //  grid.row_spacing = 60;

        var layout = new Gtk.Grid ();
        layout.column_spacing = 10;
        layout.row_spacing = 10;

        var hello_button = new Gtk.Button.with_label ("Say Hello");
        var hello_label = new Gtk.Label (null);

        var rotate_button = new Gtk.Button.with_label ("Rotate");
        var rotate_label = new Gtk.Label ("Horizontal");
        //  var button = new Gtk.Button.with_label ("Click me!");
        //  var label = new Gtk.Label (null);
        //  grid.add (button);
        //  grid.add (label);
        //  main_window.default_height = 600;
        //  main_window.default_width = 800;

        layout.attach (hello_button, 0, 0, 1, 1);
        layout.attach_next_to (hello_label, hello_button, Gtk.PositionType.RIGHT, 1, 1);
        layout.attach (rotate_button, 0, 1, 1, 1);
        layout.attach_next_to (rotate_label, rotate_button, Gtk.PositionType.RIGHT, 1, 1);

        hello_button.clicked.connect (() => {
        hello_label.label = ("Hello World!");
        hello_button.sensitive = false;
    });

        rotate_button.clicked.connect (() => {
        rotate_label.angle = 90;
        rotate_label.label = ("Vertical");
        rotate_button.sensitive = false;
    });

        main_window.title = ("GTK Grid Example");
        //  main_window.add (grid);
        main_window.add (layout);

        //  button.clicked.connect (() => {
        //      label.label = "Hello world!";
        //      button.sensitive = false;
        //  });
        main_window.show_all ();
    }

    public static int main (string[] args) {
        var app = new MyApp ();
        return app.run (args);
    }
}