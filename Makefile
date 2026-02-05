# Makefile - prompt helpers (macOS)
# Requires: ./bin/prompt (from earlier), pbcopy (built-in on macOS)
# Optional: fzf (brew install fzf)

.PHONY: help \
	p-list p-bundles p-pick p-bundle-pick \
	p-show p-copy p-bundle p-bundle-copy \
	p-rails-default p-rails-feature p-rails-review p-rails-perf p-rails-refactor p-rails-testing p-rails-sidekiq

help:
	@echo ""
	@echo "Prompt commands:"
	@echo "  make p-list             # list prompt aliases"
	@echo "  make p-bundles          # list bundles"
	@echo "  make p-pick             # interactive pick prompt (fzf), copies"
	@echo "  make p-bundle-pick      # interactive pick bundle (fzf), copies"
	@echo ""
	@echo "Generic:"
	@echo "  make p-show KEY=rails:review"
	@echo "  make p-copy KEY=rails:review"
	@echo "  make p-bundle NAME=rails:feature"
	@echo "  make p-bundle-copy NAME=rails:feature"
	@echo ""
	@echo "Rails shortcuts (copies bundle):"
	@echo "  make p-rails-feature"
	@echo "  make p-rails-review"
	@echo "  make p-rails-perf"
	@echo "  make p-rails-refactor"
	@echo "  make p-rails-testing"
	@echo "  make p-rails-sidekiq"
	@echo ""

p-list:
	@./bin/prompt list

p-bundles:
	@./bin/prompt list bundles

p-pick:
	@./bin/prompt pick

p-bundle-pick:
	@./bin/prompt bundle-pick

# Generic targets (require KEY or NAME)
p-show:
	@test -n "$(KEY)" || (echo "Missing KEY. Example: make p-show KEY=rails:review" && exit 1)
	@./bin/prompt show "$(KEY)"

p-copy:
	@test -n "$(KEY)" || (echo "Missing KEY. Example: make p-copy KEY=rails:review" && exit 1)
	@./bin/prompt copy "$(KEY)"

p-bundle:
	@test -n "$(NAME)" || (echo "Missing NAME. Example: make p-bundle NAME=rails:feature" && exit 1)
	@./bin/prompt bundle "$(NAME)"

p-bundle-copy:
	@test -n "$(NAME)" || (echo "Missing NAME. Example: make p-bundle-copy NAME=rails:feature" && exit 1)
	@./bin/prompt bundle-copy "$(NAME)"

# Rails convenience shortcuts (copies bundle to clipboard)
p-rails-default:
	@./bin/prompt bundle-copy rails:default

p-rails-feature:
	@./bin/prompt bundle-copy rails:feature

p-rails-review:
	@./bin/prompt bundle-copy rails:review

p-rails-perf:
	@./bin/prompt bundle-copy rails:perf

p-rails-refactor:
	@./bin/prompt bundle-copy rails:refactor

p-rails-testing:
	@./bin/prompt bundle-copy rails:testing

p-rails-sidekiq:
	@./bin/prompt bundle-copy rails:sidekiq
