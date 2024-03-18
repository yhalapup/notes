.PHONY: up down

up:
	@docker compose up

down:
	@docker compose down

clean:
	@docker compose down
	@docker volume prune -af
	@docker system prune -af

dbmigrate:
	@docker compose exec web bash -c "rails db:migrate"
	@docker compose exec web bash -c "rails db:migrate RAILS_ENV=test"

rspec:
	@docker compose exec web bash -c "RAILS_ENV=test rspec spec"

rspec-coverage:
	@docker compose exec web bash -c "ENABLE_COVERAGE=true RAILS_ENV=test rspec spec"
