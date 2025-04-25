# Tests for the presence of the expected workflow files

Feature: Workspace files

    As a researcher,
    I want to make sure that my Snakemake workflow produces expected files,
    so that I can be sure that the workflow outputs are correct.

    Scenario: The workspace contains the expected input files
        When the workflow is finished
        Then the workspace should include "code/gendata.C"
        And the workspace should include "code/fitdata.C"

    Scenario: The generation step creates the appropriate data file
        When the workflow is finished
        Then the workspace should contain "results/data.root"
        And the size of the file "results/data.root" should be between 150KiB and 160KiB

    Scenario: The workflow generates the correct final plot
        When the workflow is finished
        Then the workspace should contain "results/plot.png"
        And the sha256 checksum of the file "results/plot.png" should be "54165023803ce58f962816c47fe597c5df2cf24c26fa4821bb5e96f7d1b68d0b"

    Scenario: The total workspace size remains within reasonable limits
        When the workflow is finished
        Then the workspace size should be more than 150KiB
        And the workspace size should be less than 20MiB
