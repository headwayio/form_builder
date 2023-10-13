import { Application } from '@hotwired/stimulus';
import Autosave from 'stimulus-rails-autosave';

const application = Application.start();
application.register('autosave', Autosave);
