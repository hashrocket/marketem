App = Ember.Application.create();

App.Store = DS.Store.extend({
  revision: 12,
  adapter: DS.RESTAdapter,
  url: 'http://localhost:3000'
});

App.genders = ['Male', 'Female'];
App.states = ["Arkansas", "Florida"];

App.Router.map(function() {
  this.resource('recipients', function() {
    this.route('new');
  });
});

App.IndexRoute = Ember.Route.extend({
  redirect: function() {
    this.transitionTo('recipients');
  }
});

App.RecipientsIndexRoute = Ember.Route.extend({
  model: function() {
    return App.Recipient.find();
  },
  renderTemplate: function() {
    this.render();
    this.render('recipients_heading', {
      outlet: 'heading'
    });
  }
});

App.RecipientsNewRoute = Ember.Route.extend({
  renderTemplate: function() {
    this.render('recipients.new', {
      into: 'application'
    });
    this.render('add_recipient_heading', {
      outlet: 'heading'
    });
  }
});

App.RecipientsNewController = Ember.Controller.extend({
  createRecipient: function() {
    var recipient = App.Recipient.createRecord({
      fullName: this.get("fullName"),
      phone: this.get("phone"),
      state: this.get("state"),
      gender: this.get("gender")
    });
    recipient.save();
    this.transitionToRoute('recipients.index');
  }
});

App.Recipient = DS.Model.extend({
  fullName: DS.attr('string'),
  phone: DS.attr('string'),
  state: DS.attr('string'),
  gender: DS.attr('string')
});
