# Tuva Chronic Conditions

## 🧰 What does this project do?

The Tuva Project's Tuva Chronic Conditions data mart groups patients into one or more of 40 distinct chronic conditions and 8 condition families.  We created this grouper because we found problems with the CMS Chronic Condition grouper.

For information on data models and to view the entire DAG check out our dbt Docs.

## 🔌 What databases are supported?

This package has been tested on **Snowflake** and **Redshift**.

## 📚 What versions of dbt are supported?

This package requires you to have dbt installed and a functional dbt project running on dbt version `1.3.x`.

## ✅ How do I use this dbt package?

Below are the steps to run this individual dbt package.  To run all packages in The Tuva Project, please refer to this [README](https://github.com/tuva-health/the_tuva_project#readme).

### Overview

The Tuva Project is a collection of dbt packages that build healthcare concepts (measures, groupers, data quality tests) on top of your raw healthcare data. Each of these dbt packages expects you to have data in a certain format (specific tables with specific columns in them) and uses that as an input to then build healthcare concepts. To run any dbt package that is part of The Tuva Project, the basic idea is the same:

1. You create the necessary input tables as models within your dbt project so that the Tuva package of interest can reference them using ref() functions.
2. You import the Tuva package you are interested in and tell it where to find the relevant input tables as well as what database and schema to dump its output into.

### **Step 1:**

First, you must create the necessary input tables as models within your dbt project so that the Tuva package of interest can reference them using ref() functions. To run this Tuva Chronic Conditions package, you must create 1 table as a model within your dbt project.

### **Step 2:**

Once you have created the 1 necessary input table as a model within your dbt project, the next step is to import the Tuva Chronic Conditions dbt package and tell it where to find the relevant input tables as well as what database and schema to dump its output into. These things are done by editing 2 different files in your dbt project: `packages.yml` and `dbt_project.yml`.

To import the Tuva Chronic Conditions package, you need to include the following in your `packages.yml`:

```
packages:
  - package: tuva-health/tuva_chronic_conditions
    version: 0.0.1

```

To tell the Tuva Chronic Conditions package where to find the relevant input tables as well as what database and schema to dump its output into, you must add the following in your `dbt_project.yml:`

```
vars:
# These variables point to the 1 input table you created
# in your dbt project. The Tuva Chronic Conditions package will use
# this 1 table as input to build the Chronic Condition flags.
# If you named this 1 model anything other than 'condition'
# you must modify the refs here:
  core_condition_override: "{{ref('condition')}}"

# These variables name the database and schemas that the
# output of the Tuva Chronic Conditions package will be dumped into:
  tuva_database:  tuva     # make sure this database exists in your data warehouse
  tuva_chronic_conditions_schema: tuva_chronic_conditions
  terminology_schema: terminology

# By default, the Tuva Chronic Conditions package will import all
# Tuva Terminology files. If you are running the Tuva Chronic Conditions
# package alone, we recommend including these vars here
# to import only the Tuva Terminology files relevant
# for Tuva Chronic Conditions:
  tuva_packages_enabled: false
  tuva_chronic_conditions_enabled: true

# By default, dbt prefixes schema names with the target
# schema in your profile. We recommend including this
# here so that dbt does not prefix the 'tuva_chronic_conditions' schema
# with anything:
dispatch:
  - macro_namespace: dbt
    search_order: [ 'tuva_chronic_conditions', 'dbt']

```

After completing the above steps you’re ready to run your project.

- Run dbt deps to install the package
- Run dbt build to run the entire project

You now have the chronic condition tables in your database and are ready to do analytics!

## 🙋🏻‍♀️ **How is this package maintained and how do I contribute?**

The Tuva Project team maintaining this package **only** maintains the latest version of the package. We highly recommend you stay consistent with the latest version.

Have an opinion on the mappings? Notice any bugs when installing and running the package? If so, we highly encourage and welcome feedback! While we work on a formal process in Github, we can be easily reached in our Slack community.

## 🤝 Join our community!

Join our growing community of healthcare data practitioners in [Slack](https://join.slack.com/t/thetuvaproject/shared_invite/zt-16iz61187-G522Mc2WGA2mHF57e0il0Q)!