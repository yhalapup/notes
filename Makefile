.PHONY: up down

up:
	@docker compose up

down:
	@docker compose down

clean:
	@docker volume prune -af
	@docker system prune -af

dbmigrate:
	@docker compose exec web bash -c "rails db:migrate"
	@docker compose exec web bash -c "rails db:migrate RAILS_ENV=test"
