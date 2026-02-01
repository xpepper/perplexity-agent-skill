# Perplexity CLI Setup

This guide covers installation and configuration of the `llm` CLI with the Perplexity plugin.

## Prerequisites

Ensure you have Python and pip installed on your system.

## Installation

1. **Install the llm CLI**:
   ```bash
   pip install llm
   ```

   Or using Homebrew:
   ```bash
   brew install llm
   ```

2. **Install the Perplexity plugin**:
   ```bash
   llm install llm-perplexity
   ```

3. **Configure API key**:
   ```bash
   llm keys set perplexity
   ```

   When prompted, paste your Perplexity API key.

## Verification

Test the setup:
```bash
llm -m sonar 'hello'
```

You should receive a response from the Perplexity API. If you encounter errors, proceed to troubleshooting.

## Troubleshooting

### API Key Issues

If you receive authentication errors:
- Verify your API key is correctly set: `llm keys list`
- Reset the key if needed: `llm keys set perplexity`
- Ensure your Perplexity account has API access enabled

### Plugin Issues

If the `sonar` model is not found:
- Verify plugin installation: `llm plugins list`
- Reinstall if needed: `llm install llm-perplexity --upgrade`

### Model Not Available

If specific models (sonar-pro, sonar-deep-research, etc.) are not available:
- List available models: `llm models list`
- Check your Perplexity API plan - some models require higher tier access

## Documentation

- **llm CLI**: https://llm.datasette.io/
- **llm-perplexity plugin**: https://github.com/hex/llm-perplexity

For detailed documentation, troubleshooting, and advanced usage, refer to the official resources above.
