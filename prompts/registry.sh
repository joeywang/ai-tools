# prompts/registry.sh
# Simple bash "registry" for prompt aliases + bundles (no yq dependency).

# Alias -> file path
declare -A PROMPTS=(
  # Rails
  [rails:system]="prompts/rails/system.prompt"
  [rails:feature]="prompts/rails/feature.prompt"
  [rails:review]="prompts/rails/review.prompt"
  [rails:perf]="prompts/rails/perf.prompt"
  [rails:refactor]="prompts/rails/refactor.prompt"
  [rails:testing]="prompts/rails/testing.prompt"
  [rails:sidekiq]="prompts/rails/sidekiq_job.prompt"
)

# Bundle name -> ordered list of aliases/paths
# (You can mix aliases and raw file paths)
declare -A BUNDLES=(
  [rails:default]="rails:system aider/context.md"
  [rails:feature]="rails:system aider/context.md rails:feature"
  [rails:review]="rails:system aider/context.md rails:review"
  [rails:perf]="rails:system aider/context.md rails:perf"
  [rails:refactor]="rails:system aider/context.md rails:refactor"
  [rails:testing]="rails:system aider/context.md rails:testing"
  [rails:sidekiq]="rails:system aider/context.md rails:sidekiq"
)
