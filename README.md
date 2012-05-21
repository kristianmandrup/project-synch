# Project synch

Synchronize a Rails project structure at a more fine-grained level.

The success of any large project is only as good as its structural parts that should be aligned at all levels. Traditionally most Rails projects have lacked a common structure across views, locale files, css/sass files and so on. Rails ans similar frameworks have so far limited this enforced structure approach to restfulness (model/controller/view files) and lately css and coffe/javascript files for each generated view. 

This project aims to take this approach even further, by enforcing a structural approach to locale files/folders and also at the level of main page parts, including generating sass files to match the page structure and main page containers. There is also support for layouts, shared parts and generation of partials for each main page part.

See the `specs/data` folder for an example project structure.
The `project_structure.yml` file should be the output of a wireframe/use cases exercise with stakeholders at all levels. After a few iterations, the main pages and page parts should be defined and from here, the general project skeleton/ structure can be defined in a yaml file. The `project_sync:skeleton` generator can then be run in order to generate the initial skeleton structure.
Note that for large projects, the project structure can be split up into smaller parts (for easier maintenance) and also to avoid deeply nested hierarchies. Simply use the special `REF` key. The REF can take either of the following forms

`REF: my_name`

or for partials that render collections use the `!` operator:

`REF: my_name!`

Check out the `spec/fixtures` folder for a demo of what this project envisions as the resulting project file structure.

In order to add to the skeleton you can run the generator with the '--mode force' to overwrite any existing files or the '--mode merge' in order to attempt a crude merge. The merge will delete any skeleton structure no longer defined and add any not does not already exist, while ignoring matching skeleton parts.

## Design philosophies

The design philosophies come from project experience.

### Configuration

You can configure how fine-grained the skeleton structure will be built. For small projects it doesn't make sense to split up the locales and views into too fine-grained a folder struture, whereas for larger projects it is critical, in order to enable quickly dismantling a part of a page or to enable multiple developers to work on smaller files in order to minimize conflicts.

### Views

Views should be structured as follows:

* one folder per page (in default namespace)
  * show file for each page
  * main part folders if complex page (more than 3 main parts)
    * main part partials
    * sub partial folders fx to render collections

* layouts folder
  * layout file for each general layout
  * folder for each complex layout (more than 3 main parts)
    * partials 
    * folder for each complex partial (more than 3 parts)
      * sub partials (more than 3 parts)
  * shared folder
    * shared partials

* overlays folder
  * file for each overlay
  * folder for each complex overlay (more than 3 main parts)
    * partials 
  * shared folder
    * shared partials

* mailers folder
  * file for each mailer
  * folder for each complex mailer (more than 3 main parts)
    * partials 
  * shared folder
    * shared partials

* shared folder
  * file for each shared partial
  * folder for each complex partial (more than 3 main parts)
    * sub partials
* errors folder
  * file for each error screen 

### Locales

* pages 
  * page folder for each page
* layouts folder (for txt content in layouts)
* overlays folder
* mails folder
* errors folder
* conditions folder
* policies folder  

Top level yml files:

* a yml file for each top folder that contain shared entries, fx mails.yml
* policies
* conditions (& terms)
* facebook (general faceook messages)
* messages (general messages, fx flash)

### CSS/SASS files

* layouts
 * file for each layout
* pages
  * file for each page
* overlays
  * file for each overlay
* mails
  * file for each mail

Top level files:

* errors file
* policies file
* conditions file

## Integrations

### i18n-docs

The locale files should be structured to play nice with the _i18n-docs_ gem. The structure will thus be as follows:

`config/locales/en/` for all english locale files/folders.

i18n-docs expects to export a single google docs file per yml file. With the subdivision of locale files envisioned, there will be way too many docs exported. For i18n-docs integration, there is a need for a mechanism to aggregate a docs file for each page:

* one doc per page (or page groups)
* one doc for all overlays
* one doc for all mails
* one doc for all errors
* one doc for conditions and policies

The `project-structure.yml` file should enable this aggregation/split functionality for _i18n-docs_. 
The configuration file can be used to set the export detail level for each type of artifact (see fx `config/project-synch/medium.yml` the default config for medium size/complexity projects.

The `project-sync` gem will provide a nice extension for _i18n-docs_ without monkey-patching by ensuring that _i18n-docs_ has some useful extension hooks.

## Contributing to project-synch
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2012 Kristian Mandrup. See LICENSE.txt for
further details.

