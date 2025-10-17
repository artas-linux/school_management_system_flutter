# Data Model: Zen Tools Integration

## Entities

### Zen Tools Integration Framework
- **Name**: ZenToolsFramework
- **Description**: The core framework that enables integration with various Zen tools
- **Attributes**:
  - id: unique identifier for the framework instance
  - version: version of the integration framework
  - configuration: settings for tool integration
  - status: operational status of the framework
- **Relationships**: Connected to various Zen tools (thinkdeep, debug, etc.)

### Zen Tool Interface
- **Name**: ZenTool
- **Description**: Represents an individual Zen tool that can be integrated
- **Attributes**:
  - toolName: name of the specific tool (e.g., "thinkdeep", "debug")
  - toolType: category of the tool (analysis, debugging, etc.)
  - cliCommand: command to execute the tool
  - supportedFeatures: list of features supported by this tool
  - isActive: whether this tool is currently enabled
- **Relationships**: Belongs to ZenToolsFramework

### CLI Command Handler
- **Name**: CliHandler
- **Description**: Handles CLI commands and routes them to appropriate Zen tools
- **Attributes**:
  - commandName: the CLI command name (e.g., "mise run zen-thinkdeep")
  - parameters: supported command-line parameters
  - executionPath: path where the command executes
  - outputFormat: format in which the tool provides results
- **Relationships**: Connected to ZenTool for execution

### Security Configuration
- **Name**: SecurityConfig
- **Description**: Configuration settings for local processing security
- **Attributes**:
  - localOnly: flag indicating if processing is restricted to local environment
  - dataHandlingPolicy: rules for how code/data is handled by the tools
  - privacyLevel: level of data privacy required (1-5 scale)
  - encryptionRequired: whether encryption is required for any data
- **Relationships**: Belongs to ZenToolsFramework

## State Transitions

### ZenTool State Transitions
- `NOT_INSTALLED` → `INSTALLED` (when tool is set up in the environment)
- `INSTALLED` → `CONFIGURED` (when tool is properly configured)
- `CONFIGURED` → `ACTIVE` (when tool is enabled for use)
- `ACTIVE` → `INACTIVE` (when tool is temporarily disabled)

### CliHandler State Transitions
- `UNREGISTERED` → `REGISTERED` (when command is added to CLI system)
- `REGISTERED` → `ACTIVE` (when command is available for use)
- `ACTIVE` → `DISABLED` (when command is temporarily disabled)