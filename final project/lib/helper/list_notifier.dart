import 'package:blogapp/models/blogmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

  final BlogList = Provider<List<blogModel>>((ref) =>  [
    blogModel(
        username: "amnashaikh121",
        title: "This is Panda",
        description: "They like to play with enrichment items like piles of ice or sawdust, puzzles made of bamboo with food inside, and different scents like spices",
        imageURL: "https://tinypng.com/images/social/website.jpg",
        userProfile:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
    blogModel(
        username: "aqsashaikh121",
        title: "Let's talk about nature",
        description: "Nature is a British weekly scientific journal founded and based in London, England. As a multidisciplinary publication, Nature features peer-reviewed research from a variety of academic disciplines, mainly in science and technology",
        imageURL:
        "https://www.metoffice.gov.uk/binaries/content/gallery/metofficegovuk/hero-images/advice/maps-satellite-images/satellite-image-of-globe.jpg",
        userProfile:
        'https://img.freepik.com/free-photo/close-up-portrait-cheerful-glamour-girl-with-cute-make-up-smiling-white-teeth-looking-happy-camera-standing-blue-background_1258-70300.jpg?w=2000'),
    blogModel(
        username: "helo123",
        title: "What is balloon?",
        description: "A balloon is a flexible bag that can be inflated with a gas, such as helium, hydrogen, nitrous oxide, oxygen, and air. For special tasks, balloons can be filled with smoke, liquid water, granular media",
        imageURL:
        "https://www.akamai.com/site/im-demo/perceptual-standard.jpg?imbypass=true",
        userProfile: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80"),
  ]);
final userList = Provider<List<blogModel>>((ref) => [

]);
